Puppet::Type.newtype(:yum_conf_setting) do
  ensurable
  newparam(:name, :namevar => true) do
    desc 'Section/setting name to manage from yum.conf'
    # namevar should be of the form section/setting
    newvalues(/\S+\/\S+/)
  end
  newproperty(:value) do
    desc 'The value of the setting to define'
    munge do |v|
      v.to_s.strip
    end
  end
end
