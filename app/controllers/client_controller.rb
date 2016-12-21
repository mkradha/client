class ClientController < ApplicationController

  # Identify the device currently associated with a given address.
  def get_device_by_ip
    ip = params[:ip]
    @response = HTTParty.get(Rails.configuration.host + ip)
    respond_to do |format|
      format.json { render json: @response }
    end
  end

  # Assign an address to a device.
  def assign_ip_address
    @response = HTTParty.post(Rails.configuration.host + "/assign_ip".to_str,
                            :query => { ip_address: '1.2.83.23', device_name: 'Device3'},
                            :headers => { 'Content-Type' => 'application/json' } )
    respond_to do |format|
      format.json { render json: @response.body }
    end
  end

  # Scenarios
  # replace the query parameter to get response from the service
  # multiple ip assignment
  # :query => { ip_address: '1.2.3.4', device_name: 'Device5'}
  # :query => { ip_address: '1.2.5.6', device_name: 'Device5'}

  # Same ip assignment
  # :query => { ip_address: '1.2.7.4', device_name: 'Device1'}

  # New ip assignment
  # :query => { ip_address: '1.2.8.9', device_name: 'Device10'}

  # Invalid ip range
  # :query => { ip_address: '133.233.73.23', device_name: 'Device8'}

end

