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

class Kalix < Formula
    version "2.0.63"
    desc "Kalix :: Command Line Interface"
    homepage "https://kalix.io"
    license "https://downloads.lightbend.com/website/legal/lightbend-commercial-software-license-agreement.txt"

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.kalix.io/#{version}/kalix_darwin_amd64_#{version}.tar.gz"
            sha256 "d05b1a1066eb4a562db831a0a7a28cf0cbc799eb9356fa11fa0af8868e1a4bc1"
        else
            url "https://downloads.kalix.io/#{version}/kalix_darwin_arm64_#{version}.tar.gz"
            sha256 "30b6f66b29deb3a79d91f34949eb1ca156044e710e51aa138b1a341815dd82c2"
        end
    end

    if OS.linux?
        url "https://downloads.kalix.io/#{version}/kalix_linux_amd64_#{version}.tar.gz"
        sha256 "bde7c4a4223f4efffa5e50ec5ff8613121eeb112cda986df7041dee81499a4db"
    end

    def install
        bin.install "kalix"
        prefix.install "lightbend-commercial-software-license-agreement.txt"
        (bash_completion/"kalix").write `#{bin}/kalix completion --shell bash`
        (fish_completion/"kalix.fish").write `#{bin}/kalix completion --shell fish`
        (zsh_completion/"_kalix").write `#{bin}/kalix completion --shell zsh`
    end

    def caveats
        <<~EOS
        #{name} is the command line interface for Kalix.

            Accounts:
                To use #{name} you'll need to have an active account on Kalix.
                You can register for an account on https://console.kalix.io
                or sign up using
                #{name} auth signup

            Log in:
                To log in to your Kalix account, run
                #{name} auth login

        EOS
    end

    test do
        assert_equal version, shell_output("#{bin}/kalix version").strip
    end
end
