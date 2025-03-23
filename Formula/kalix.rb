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
    version "2.0.61"
    desc "Kalix :: Command Line Interface"
    homepage "https://kalix.io"
    license "https://downloads.lightbend.com/website/legal/lightbend-commercial-software-license-agreement.txt"

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.kalix.io/#{version}/kalix_darwin_amd64_#{version}.tar.gz"
            sha256 "1f8686d35d2d486d4a6f5d134fb8146eb6b3f356e8d589358c81a97092df912f"
        else
            url "https://downloads.kalix.io/#{version}/kalix_darwin_arm64_#{version}.tar.gz"
            sha256 "750a871dce0bcf917ff9d4aa5fc249bbfd7b5d6458115ad2c4100ec18bb300a1"
        end
    end

    if OS.linux?
        url "https://downloads.kalix.io/#{version}/kalix_linux_amd64_#{version}.tar.gz"
        sha256 "f7784ff29b903d80dc70cbff6651550ca28a1ce0fbfb0d373a04790c6c75538e"
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
