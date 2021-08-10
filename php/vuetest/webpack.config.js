var path = require('path');
const VueLoaderPlugin =  require('vue-loader/lib/plugin');

module.exports = {
  entry: ['./src/main.js'],     //项目入口文件的路径，可以有多个文件
  output: {     //定义webpack输出的文件，这里设置了文件输出在dist文件夹下面的build.js
    path: './dist',
    publicPath:'./dist/',
    filename: 'build.js'
  },
  //配置自动刷新,如果打开会使浏览器刷新而不是热替换
  /*devServer: {
    historyApiFallback: true,
    hot: false,
    inline: true,
    grogress: true
  },*/
  plugins: [
    new VueLoaderPlugin()
  ],
  module: {
    rules: [
        {test: /\.vue/, use: 'vue-loader'}  //处理.vue结尾的文件
    ],
    loaders: [
      //转化ES6语法
      {
        test: /\.js$/,          //这里是匹配文件的正则
        loader: 'babel',        //这里是指定调用loader去处理对应文件类型
        exclude: /node_modules/
      },
      //解析.vue文件
      {
        test:/\.vue$/,
        loader:'vue'
      },
      //图片转化，小于8K自动转化为base64的编码
      {
        test: /\.(png|jpg|gif)$/,
        loader:'url-loader?limit=8192'
      }
    ]
  },
  vue:{
    loaders:{
      js:'babel' //loader来这里吧。
    }
  },
  resolve: {
        // require时省略的扩展名，如：require('app') 不需要app.js
        extensions: ['', '.js', '.vue'],
        // 配置简写，路径可以省略文件类型
        alias: {
            filter: path.join(__dirname, './src/filters'),
            components: path.join(__dirname, './src/components'),
            'vue$': 'vue/dist/vue.esm.js' //内部为正则表达式  vue结尾的
        }
    }
}