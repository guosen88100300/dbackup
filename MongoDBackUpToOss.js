/**
 * Created by guosen on 2017/2/8.
 */
var co = require('co');
var OSS = require('ali-oss');
var client = new OSS({
  //region: '<Your region>',
  //accessKeyId: '<Your AccessKeyId>',
  //accessKeySecret: '<Your AccessKeySecret>',
  //bucket:'<Your bucket>'
});
var folder='mongodbackup';
var localFile=process.argv[2];
var fileName=process.argv[3];
console.log('localFile:',localFile);
console.log('fileName',fileName);
co(function* () {
  var result = yield client.multipartUpload('/'+folder+'/'+fileName, localFile);
  console.log(result);
  process.exit()
}).catch(function (err) {
  console.log(err);
  process.exit()
});
