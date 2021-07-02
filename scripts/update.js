const http = require("https");
const cp = require("child_process");

const options = {
    "method": "GET",
    "hostname": "downloads.akkaserverless.com",
    "path": "/latest/checksums.txt",
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
            if (element.includes('darwin_amd64')) {
                const sha = element.substring(0, element.indexOf(' '));
                updateLine(24, `            sha256 \\"${sha}\\"`);
            } else if (element.includes('darwin_arm64')) {
                const sha = element.substring(0, element.indexOf(' '));
                updateLine(27, `            sha256 \\"${sha}\\"`);
            } else if (element.includes('linux')) {
                const version = element.substring(element.indexOf('amd64_') + 6, element.indexOf('.tar.gz'));
                console.log(`Found version ${version} in latest/checksums.txt`);
                updateLine(16, `    version \\"${version}\\"`);
                const sha = element.substring(0, element.indexOf(' '));
                updateLine(33, `        sha256 \\"${sha}\\"`);
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