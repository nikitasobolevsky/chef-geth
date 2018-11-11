# # encoding: utf-8

describe service('geth') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(8545) do
  it { should be_listening }
  its('protocols') { should cmp 'tcp' }
end

describe port(8546) do
  it { should be_listening }
  its('protocols') { should cmp 'tcp' }
end

describe port(30303) do
  it { should be_listening }
  its('protocols') { should include('tcp') }
  its('protocols') { should include('udp') }
end

