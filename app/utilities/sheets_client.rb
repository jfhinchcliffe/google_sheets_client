require 'google/apis/sheets_v4'
require 'googleauth' # https://github.com/googleapis/google-auth-library-ruby

class SheetsClient
  # From the Google client json file
  CREDS = {
    "auth_provider_x509_cert_url": ENV['AUTH_PROVIDER_X509_CERT_URL'],
    "auth_uri": ENV['AUTH_URI'],
    "client_email": ENV['CLIENT_EMAIL'],
    "client_id": ENV['CLIENT_ID'],
    "client_x509_cert_url": ENV['CLIENT_X509_CERT_URL'],
    "private_key_id": ENV['PRIVATE_KEY_ID'],
    "private_key": ENV['PRIVATE_KEY'],
    "project_id": ENV['PROJECT_ID'],
    "token_uri": ENV['TOKEN_URI'],
    "type": ENV['TYPE']
  }

  SPREADSHEET_SCOPE = 'https://www.googleapis.com/auth/spreadsheets'.freeze

  def sheet
    authorise_service(sheet_service)
  end

  private

  def authorise_service(service)
    service.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(creds_file),
      scope: SPREADSHEET_SCOPE)

    service.authorization.fetch_access_token!

    service
  end

  def sheet_service
    Google::Apis::SheetsV4::SheetsService.new
  end

  def creds_file
    tempfile = Tempfile.new('changed')
    tempfile.write CREDS.to_json
    tempfile.rewind
    tempfile
  end

  def authorised_sheet_service
    sheet_service
  end
end