require 'aws-sdk'

module Ec2UtilsSample

  REGIONS = [
    'us-east-1',
    'us-west-1',
    'us-west-2',
    'eu-west-1',
    'eu-central-1',
    'ap-southeast-1',
    'ap-southeast-2',
    'ap-northeast-1',
    'sa-east-1'
  ]

  def self.list_instances(profile: profile)
    map = {}

    REGIONS.each do |region|
      instances = list_instances_in_region(profile: profile, region: region)
      $log.debug "#{region}: #{instances.count}"
      map[region] = instances.count
    end

    map
  end

  def self.list_instances_in_region(profile: profile, region: region)
    instances = []

    opts = {}
    opts[profile_name: profile] if profile
    ec2 = Aws::EC2::Client.new(region: region, credentials: Aws::SharedCredentials.new(opts))

    ec2.describe_instances(
      filters: [{name: 'instance-state-name', values: ['running']}]
    ).each do |response|
      response[:reservations].each do |reservation|
        instances.concat(reservation[:instances])
      end
    end

    return instances
  end

end
