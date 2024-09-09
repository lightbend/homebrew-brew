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
    version "2.0.51"
    desc "Kalix :: Command Line Interface"
    homepage "https://kalix.io"
    license "https://downloads.lightbend.com/website/legal/lightbend-commercial-software-license-agreement.txt"

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.kalix.io/#{version}/kalix_darwin_amd64_#{version}.tar.gz"
            sha256 "cbba51d7b39bdfa8fd9e0b03b24a59bdef6503030025c1659d447a0ca64302bc"
        else
            url "https://downloads.kalix.io/#{version}/kalix_darwin_arm64_#{version}.tar.gz"
            sha256 "d5624e03efabe0d68bc18b4e3f58921dd287c6e8084226769d33a4695726fa2d"
        end
    end

    if OS.linux?
        url "https://downloads.kalix.io/#{version}/kalix_linux_amd64_#{version}.tar.gz"
        sha256 "5b2cd8e8764c8084978533323b4f576defa533baec8a53e16788242f71cdd10e"
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
