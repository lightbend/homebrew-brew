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
    version "0.0.32"
    desc "Akka Serverless :: Command Line Interface"
    homepage "https://akkaserverless.com"
    license ""

    if OS.mac?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_amd64_#{version}.tar.gz"
        sha256 "cb2ff280898656fa1f8e65465e5b21278abd20ac562dcf9e099cb0a309d657c5"
    end

    if OS.linux?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_linux_amd64_#{version}.tar.gz"
        sha256 "1aa1fb6c891fb67aeac068bba9d7a37d8f9bd915b020da45f220773bb2fdfe2d"
    end

    def install
        bin.install "akkasls"
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
