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

class KubectlCloudflow < Formula
    version "2.0.25"
    desc "Akka Data Pipelines :: Command Line Interface"
    homepage "https://cloudflow.io"
    license ""

    if OS.mac?
        url "https://bintray.com/lightbend/cloudflow-cli/download_file?file_path=kubectl-cloudflow-#{version}-darwin-amd64.tar.gz"
        sha256 "6b15098fc6f5bf02bb69551a9c9173e88e21768b347f159f30cb8861e9c30a80"
    end

    if OS.linux?
        url "https://bintray.com/lightbend/cloudflow-cli/download_file?file_path=kubectl-cloudflow-#{version}-linux-amd64.tar.gz"
        sha256 "7becc1eb987b09f7190e7664ab05cdfd3a5db7aaa688db5ba98aef844ee8bd76"
    end

    depends_on "sbt"
    depends_on "kubectl"
    depends_on "kubernetes-helm"

    def install
        bin.install "kubectl-cloudflow"
    end

    def caveats
        <<~EOS
        The #{name} command line interface is an extension to kubectl used to develop and deploy Cloudflow applications. 

            As prerequisites you'll need:
                * Java (JDK): >= 8
                * Docker    : v18.09 or higher

            As part of this installation, sbt, helm, and kubectl are already installed. For more info
            see https://developer.lightbend.com/docs/cloudflow/current/get-started/prepare-development-environment.html

        EOS
    end
    
    test do
        assert_match /#{version}/, shell_output("#{bin}/kubectl-cloudflow version").strip
    end
end