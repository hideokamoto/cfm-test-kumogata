 VPC do
  Type "AWS::EC2::VPC"
  Properties do
    EnableDnsSupport "true"
    EnableDnsHostnames "true"
    InstanceTenancy "default"
    CidrBlock  "10.0.0.0/16"
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      },
      _{
        Key "Network"
        Value "Public"
      }
    ]
  end
end

PublicSubnet do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock  "10.0.0.0/24"
    VpcId do
      Ref "VPC"
    end
  end
end
