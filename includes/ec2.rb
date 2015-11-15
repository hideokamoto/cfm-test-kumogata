sampleEC2Instance do
  Type "AWS::EC2::Instance"
  Properties do
    ImageId "ami-f0091d91"
    InstanceInitiatedShutdownBehavior "stop"
    InstanceType { Ref "InstanceType" }
    #KeyName "cfnsample"
    SubnetId {
      Ref "PublicSubnet"
    }

    UserData do
      Fn__Base64 (<<-EOS).undent
        #!/bin/bash
        yum install -y httpd
        service httpd start
      EOS
    end
  end
end
