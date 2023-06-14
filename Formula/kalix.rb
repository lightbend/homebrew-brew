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
    version "2.0.20"
    desc "Kalix :: Command Line Interface"
    homepage "https://kalix.io"
    license ""

    if OS.mac?
        if Hardware::CPU.intel?
            url "https://downloads.kalix.io/#{version}/kalix_darwin_amd64_#{version}.tar.gz"
            sha256 "0b91a7fdfbce07d6843d9694caf25f5e4cf9a297962659e01c55b9ce585e3605"
        else
            url "https://downloads.kalix.io/#{version}/kalix_darwin_arm64_#{version}.tar.gz"
            sha256 "908c1d90ac62aa8109c6b8aab8c966882b3a50939d5b24d1e68d4434cf1a5473"
        end
    end

    if OS.linux?
        url "https://downloads.kalix.io/#{version}/kalix_linux_amd64_#{version}.tar.gz"
        sha256 "4f7df4e5ab0525389a45796ff08fb3a1279819a55fa2bd1c0b79ce679fc662c8"
    end

    def install
        bin.install "kalix"
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
