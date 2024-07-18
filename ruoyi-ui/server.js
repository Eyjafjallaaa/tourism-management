const express = require('express');
const nodemailer = require('nodemailer');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(bodyParser.json());

// 更详细的 CORS 配置
const corsOptions = {
  origin: 'http://localhost', // 允许来自 http://localhost 的请求
  methods: ['GET', 'POST'], // 允许 GET 和 POST 请求
  allowedHeaders: ['Content-Type'], // 允许 Content-Type 头部
  optionsSuccessStatus: 200 // 设置预检请求成功的状态码
};
app.use(cors(corsOptions));

const transporter = nodemailer.createTransport({
  service: 'qq', // 使用QQ邮箱
  auth: {
    user: '1420014356@qq.com', // 你的QQ邮箱
    pass: 'dugairqiwebfjihc' // 你的SMTP授权码
  }
});

const sendEmail = async (to, subject, text) => {
  const mailOptions = {
    from: '1420014356@qq.com',
    to: to,
    subject: subject,
    text: text
  };

  try {
    await transporter.sendMail(mailOptions);
    console.log('Email sent successfully');
  } catch (error) {
    console.error('Failed to send email', error);
  }
};

app.post('/check-visitor-count', (req, res) => {
  const { count } = req.body;

  if (count > 100) {
    sendEmail('vincentdeng0727@gmail.com', '游客人数超过100人', `当前景区人数为 ${count} 人`);
  }

  res.sendStatus(200);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
