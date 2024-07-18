var path = require('path')
function resolve(dir) {
  return path.join(__dirname, dir)
}
module.exports = {
  assetsDir: 'static',
  parallel: false,
  publicPath: './',
  configureWebpack: {
    resolve: {
      alias: {
        '@': resolve('src')
      }
    },
    module:{
      rules:[{
        test:/\.mjs$/,
        include: /node_modules/,
        type: "javascript/auto"
      }]
    },

  },
  devServer: {
    // 项目运行时候的端口号
    port: 3000
  }
}