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
    version "0.1.8"
    desc "Akka Serverless :: Command Line Interface"
    homepage "https://akkaserverless.com"
    license ""

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_amd64_#{version}.tar.gz"
            sha256 "97bf53113dfa2883bb7fd92ba271385e5742de523925ef91c048d8ee9d23daaf"
        else
            url "https://downloads.akkaserverless.com/#{version}/akkasls_darwin_arm64_#{version}.tar.gz"
            sha256 "0dabddfaddb726857a329bf6e772c5db1633c74c9ca680f600ce9bcf94a00e68"
        end
    end

    if OS.linux?
        url "https://downloads.akkaserverless.com/#{version}/akkasls_linux_amd64_#{version}.tar.gz"
        sha256 "4f860d2e5a337950376fb4b90a225cb50e368cb69a21dec41074eac6786dea9f"
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
