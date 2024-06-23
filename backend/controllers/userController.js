const users = require("../models/userSchema");
const userotp = require("../models/userOtp");
const nodemailer = require("nodemailer");
const bcrypt = require("bcryptjs");


// email config
const tarnsporter = nodemailer.createTransport({
    host: process.env.EMAIL_HOST,
    port: process.env.EMAIL_PORT,
    service: process.env.EMAIL_SERVICE,
    auth: {
        user: process.env.EMAIL,
        pass: process.env.EMAIL_PASSWORD
    }
});


exports.userregister = async (req, res) => {
    const { fname, lname, email, password , dateOfBirth ,country, state,city, postalcode, termsAccepted } = req.body;

    if (!fname || !lname || !email || !password || !dateOfBirth || !country || !state ||!city ||!postalcode ||!termsAccepted) {
        res.status(400).json({ error: "Please Enter All Input Data" })
    }

    try {
        const presuer = await users.findOne({ email: email });

        if (presuer) {
            res.status(400).json({ error: "This User Allready exist in our db" })
        } else {

            const hashedPassword = await bcrypt.hash(password, 12);
            const newUser = new users({
                fname,
                lname,
                email,
                password :hashedPassword, // Assuming password is hashed before saving
                dateOfBirth,
                country,
                state,
                city,
                postalCode: postalcode,
                termsAccepted
            });
    
            // Save the new user to the database
            const savedUser=await newUser.save();
            console.log(`User registered successfully: ${savedUser}`);
    
            // Generate JWT token for the new user and append it to tokens array
            const token = await newUser.generateAuthToken();
    
            // Return a success response with the user data and token
            res.status(200).json({
                message: "User signed up successfully",
                user: {
                    _id: newUser._id,
                    fname: newUser.fname,
                    lname: newUser.lname,
                    email: newUser.email,
                    dateOfBirth: newUser.dateOfBirth,
                    country: newUser.country,
                    state: newUser.state,
                    city: newUser.city,
                    postalCode: newUser.postalCode,
                    termsAccepted: newUser.termsAccepted
                },
                userToken: token
            });
        }
       
    } catch (error) {
        console.error("Error registering user:", error);
        res.status(400).json({ error: "Invalid Details", error })
    }

};



// user send otp
exports.userOtpSend = async (req, res) => {
    const { email } = req.body;

    if (!email) {
        res.status(400).json({ error: "Please Enter Your Email" })
    }


    try {
        const presuer = await users.findOne({ email: email });

        if (presuer) {
            const OTP = Math.floor(100000 + Math.random() * 900000);

            const existEmail = await userotp.findOne({ email: email });


            if (existEmail) {
                const updateData = await userotp.findByIdAndUpdate({ _id: existEmail._id }, {
                    otp: OTP
                }, { new: true }
                );
                await updateData.save();

                const mailOptions = {
                    from: process.env.EMAIL,
                    to: email,
                    subject: "Sending Email For Otp Validation",
                    text: `OTP:- ${OTP}`
                }


                tarnsporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        console.log("error", error);
                        res.status(400).json({ error: "email not send" })
                    } else {
                        console.log("Email sent", info.response);
                        res.status(200).json({ message: "Email sent Successfully" })
                    }
                })

            } else {

                const saveOtpData = new userotp({
                    email, otp: OTP
                });

                await saveOtpData.save();
                const mailOptions = {
                    from: process.env.EMAIL,
                    to: email,
                    subject: "Sending Eamil For Otp Validation",
                    text: `OTP:- ${OTP}`
                }

                tarnsporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        console.log("error", error);
                        res.status(400).json({ error: "email not send" })
                    } else {
                        console.log("Email sent", info.response);
                        res.status(200).json({ message: "Email sent Successfully" })
                    }
                })
            }
        } else {
            res.status(400).json({ error: "This User Not Exist In our Db" })
        }
    } catch (error) {
        res.status(400).json({ error: "Invalid Details", error })
    }
};


exports.userLogin = async(req,res)=>{
    const {email,otp} = req.body;

    if(!otp || !email){
        res.status(400).json({ error: "Please Enter Your OTP and email" })
    }

    try {
        const otpverification = await userotp.findOne({ email: email });

        if (otpverification.otp === otp) {
            const preuser = await users.findOne({ email: email });

            // token generate
            const token = await preuser.generateAuthToken();
            console.log("User login successfully:", preuser);
            return res.status(200).json({ message: "User Login Successfully Done", userToken: token });
        } else {
            return res.status(400).json({ error: "Invalid OTP" });
        }
    } catch (error) {
        res.status(400).json({ error: "Invalid Details", error })
    }
}