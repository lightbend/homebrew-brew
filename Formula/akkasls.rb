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
    version "0.1.7"
    desc "Akka Serverless :: Command Line Interface"
    homepage "https://akkaserverless.com"
    license ""

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_amd64_#{version}.tar.gz"
            sha256 "f89ce1350c26c633e77d5b533f03a66b2137309631b707b9cab426b3ffd6f5b7"
        else
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_arm64_#{version}.tar.gz"
            sha256 "5c1a4ef73eb5d77dc2426e59873a3bf7a79243f681211b2a58fcc60b7070a873"
        end
    end

    if OS.linux?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_linux_amd64_#{version}.tar.gz"
        sha256 "b68d9aee80b99e7e900a14c7bedb60b7b7f55c54f1d6eae7a31ae57d55ba3fe3"
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
