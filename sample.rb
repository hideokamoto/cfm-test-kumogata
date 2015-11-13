AWSTemplateFormatVersion "2010-09-09"

Description (<<-EOS).undent
  Kumogata Sample Template
  You can use Here document!
EOS

Parameters do
  InstanceType do
    Default "t2.micro"
    Description "Instance Type"
    Type "String"
  end
end

Resources do
  myEC2Instance do
    Type "AWS::EC2::Instance"
    Properties do
      ImageId "ami-f0091d91"
      InstanceType { Ref "InstanceType" }
      KeyName "your_key_name"

      UserData do
        Fn__Base64 (<<-EOS).undent
          #!/bin/bash
          yum install -y httpd
          service httpd start
        EOS
      end
    end
  end
end

Outputs do
  AZ do
    Value do
      Fn__GetAtt "myEC2Instance", "AvailabilityZone"
    end
  end
end
