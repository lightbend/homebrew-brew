const http = require("https");
const cp = require("child_process");

const options = {
    "method": "GET",
    "hostname": "downloads.akkaserverless.com",
    "path": "/stable/checksums.txt",
    "headers": {
        "Content-Type": "Application/x-www-form-urlencoded",
        "Content-Length": "0"
    }
};

const req = http.request(options, function (res) {
    const chunks = [];

    res.on("data", function (chunk) {
        chunks.push(chunk);
    });

    res.on("end", function () {
        const body = Buffer.concat(chunks);
        const lines = body.toString().split('\n');
        lines.forEach(element => {
            if (element.includes('darwin')) {
                const version = element.substring(element.indexOf('amd64_') + 6, element.indexOf('.tar.gz'));
                const sha = element.substring(0, element.indexOf(' '));
                updateLine(16, `    version \\"${version}\\"`);
                updateLine(23, `        sha256 \\"${sha}\\"`);
            } else if (element.includes('linux')) {
                const sha = element.substring(0, element.indexOf(' '));
                updateLine(28, `        sha256 \\"${sha}\\"`);
            }
        });
    });
});

req.end();

function updateLine(line, content) {
    cp.exec(`sed -i "${line}s/.*/${content}/" Formula/akkasls.rb`, (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
    });
}