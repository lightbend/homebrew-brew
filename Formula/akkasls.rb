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
    version "0.0.40"
    desc "Akka Serverless :: Command Line Interface"
    homepage "https://akkaserverless.com"
    license ""

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_amd64_#{version}.tar.gz"
            sha256 "aa259de5182e9b6cdf6d403f5b5de3b4261b8cab2f157ff669d42c963120ef30"
        else
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_arm64_#{version}.tar.gz"
            sha256 "c2e3ec3254b739fe751efa388b3feea664c17b5a105c78610eff63bf7f56ff40"
        end
    end

    if OS.linux?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_linux_amd64_#{version}.tar.gz"
        sha256 "32370a4f54daf574338fcf6cd92b27e144db16e48e451463402c8ae13e32435c"
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
