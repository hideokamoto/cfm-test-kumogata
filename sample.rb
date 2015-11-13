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
  _include 'includes/ec2.rb'
end

Outputs do
  AZ do
    Value do
      Fn__GetAtt "sampleEC2Instance", "AvailabilityZone"
    end
  end
end
