require 'google/apis/sheets_v4'
require 'googleauth' # https://github.com/googleapis/google-auth-library-ruby
class SheetsClient

  # From the Google client json file
  CREDS = {
    "type": ENV['TYPE'],
    "project_id": ENV['PROJECT_ID'],
    "private_key_id": ENV['PRIVATE_KEY_ID'],
    "private_key": ENV['PRIVATE_KEY'],
    "client_email": ENV['CLIENT_EMAIL'],
    "client_id": ENV['CLIENT_ID'],
    "auth_uri": ENV['AUTH_URI'],
    "token_uri": ENV['TOKEN_URI'],
    "auth_provider_x509_cert_url": ENV['AUTH_PROVIDER_X509_CERT_URL'],
    "client_x509_cert_url": ENV['CLIENT_X509_CERT_URL']
  }

  SPREADSHEET_SCOPE = 'https://www.googleapis.com/auth/spreadsheets'

  def get_rows
    content = sheet_service

    content.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open(creds_file),
      scope: SPREADSHEET_SCOPE)

    content.authorization.fetch_access_token!
    # Service methods: https://googleapis.dev/ruby/google-api-client/latest/Google/Apis/ContentV2/ShoppingContentService.html

    spreadsheet_id = "1eu1Dk67gKnrIgQQ9Fm0Y-RCMzRfZf1UaTQzEt7hjWp0"
    range = "Sheet1!A1:E"
    # response = content.get_spreadsheet_values spreadsheet_id, range
    response = content.get_spreadsheet_values(spreadsheet_id, range)

    # binding.pry
    # puts "Name, Major:"
    # puts "No data found." if response.values.empty?

    response.values
  end

  private

  def sheet_service
    Google::Apis::SheetsV4::SheetsService.new
  end

  def creds_file
    tempfile = Tempfile.new("changed")
    tempfile.write CREDS.to_json
    tempfile.rewind
    tempfile
  end

  def authorised_sheet_service
    sheet_service
  end
end