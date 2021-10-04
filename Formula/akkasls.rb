# Copyright 2021 Lightbend Inc.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Akkasls < Formula
    version "0.1.1"
    desc "Akka Serverless :: Command Line Interface"
    homepage "https://akkaserverless.com"
    license ""

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_amd64_#{version}.tar.gz"
            sha256 "215a5fea419b0153446bb79166a70d900d869205d14c81de3eb9aca57b8d074c"
        else
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_arm64_#{version}.tar.gz"
            sha256 "617b96ab21bbd74e9424ce9c48044a51604d5c6f20d88db6f2ea2f88dc0831b7"
        end
    end

    if OS.linux?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_linux_amd64_#{version}.tar.gz"
        sha256 "5a437f12a61f4212cf0bd7db47ed18f1a771d44846cec18ed922282959f19742"
    end

    def install
        bin.install "akkasls"
        (bash_completion/"akkasls").write `#{bin}/akkasls completion --shell bash`
        (fish_completion/"akkasls.fish").write `#{bin}/akkasls completion --shell fish`
        (zsh_completion/"_akkasls").write `#{bin}/akkasls completion --shell zsh`
    end

    def caveats
        <<~EOS
        #{name} is the command line interface for Akka Serverless. 
        
            Accounts:
                To use #{name} you'll need to have an active account on Akka Serverless.
                You can register for an account on https://console.akkaserverless.com

            Log in:
                To log in to your Akka Serverless account, run
                #{name} auth login

        EOS
    end

    test do
        assert_equal version, shell_output("#{bin}/akkasls version").strip
    end
end
