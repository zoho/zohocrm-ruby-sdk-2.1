module DC
  class DataCenter
    def get_iam_url
      nil
    end

    def get_file_upload_url
      nil
    end

    class Environment
      attr_reader :accounts_url, :url, :file_upload_url,:name
      def initialize(url, accounts_url, file_upload_url, name)
        @url = url
        @accounts_url = accounts_url
        @file_upload_url = file_upload_url
        @name = name
      end
    end
  end
end
