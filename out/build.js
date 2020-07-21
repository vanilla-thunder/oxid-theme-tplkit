const fs = require('fs'),
    nodeSass = require('node-sass'),
    cleanCSS = require('clean-css');

console.log();
console.log("copying files");
fs.copyFileSync('node_modules/bootstrap/dist/js/bootstrap.bundle.js', 'src/js/bootstrap.bundle.js');
fs.copyFileSync('node_modules/bootstrap/dist/js/bootstrap.bundle.min.js', 'src/js/bootstrap.bundle.min.js');
fs.copyFileSync('node_modules/bootstrap/dist/css/bootstrap.css', 'src/css/bootstrap.css');
fs.copyFileSync('node_modules/bootstrap/dist/css/bootstrap.min.css', 'src/css/bootstrap.min.css');


console.log("compiling scss");
var result = nodeSass.renderSync({
    file: 'src/css/styles.scss',
    outFile: 'src/css/style.css',
    sourceMap: true
});
fs.writeFileSync('src/css/styles.css', result.css);

//var compresed =

/*, function (err, result)
{
    console.log(result.css);

    if (error)
    {
        console.log("error compiling sass:");
        console.log(error);
    }
    else fs.writeFile('src/css/styles.css', result.css, function (err)
    {
        if (!err)
        {
            var minified = new CleanCSS().minify(result.css);
            fs.writeFile('src/css/styles.min.css', minified);
            //var gzip = zlib.createGzip(),
            //    out = fs.createWriteStream('input.txt.gz');
            //fs.createWriteStream('input.txt.gz');
        }
    });

});
*/
//.scripts(['src/js/scripts.js'], 'src/js/scripts.min.js')
//.sass('src/css/styles.scss', 'src/css');


console.log("done");
console.log();