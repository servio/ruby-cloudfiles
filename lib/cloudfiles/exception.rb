# The deprecated old exception types.  Will go away in a couple of releases.

class SyntaxException             < StandardError # :nodoc:
end
class ConnectionException         < StandardError # :nodoc:
end
class AuthenticationException     < StandardError # :nodoc:
end
class InvalidResponseException    < StandardError # :nodoc:
end
class NonEmptyContainerException  < StandardError # :nodoc:
end
class NoSuchObjectException       < StandardError # :nodoc:
end
class NoSuchContainerException    < StandardError # :nodoc:
end
class NoSuchAccountException      < StandardError # :nodoc:
end
class MisMatchedChecksumException < StandardError # :nodoc:
end
class IOException                 < StandardError # :nodoc:
end
class CDNNotEnabledException      < StandardError # :nodoc:
end
class ObjectExistsException       < StandardError # :nodoc:
end
class ExpiredAuthTokenException   < StandardError # :nodoc:
end

# The new properly scoped exceptions.

module ::CloudFiles
  module Exceptions

    class Error              < StandardError; end # :nodoc:
    class Syntax             < Error; end # :nodoc:
    class Connection         < Error; end # :nodoc:
    class Authentication     < Error; end # :nodoc:
    class InvalidResponse    < Error; end # :nodoc:
    class NonEmptyContainer  < Error; end # :nodoc:
    class NoSuchObject       < Error; end # :nodoc:
    class NoSuchContainer    < Error; end # :nodoc:
    class NoSuchAccount      < Error; end # :nodoc:
    class MisMatchedChecksum < Error; end # :nodoc:
    class IO                 < Error; end # :nodoc:
    class CDNNotEnabled      < Error; end # :nodoc:
    class ObjectExists       < Error; end # :nodoc:
    class ExpiredAuthToken   < Error; end # :nodoc:
    class CDNNotAvailable    < Error; end # :nodoc:

    class ClientException < Error
      attr_reader :scheme, :host, :port, :path, :query, :status, :reason, :devices
      def initialize(msg, params={})
        @msg     = msg
        @scheme  = params[:http_scheme]
        @host    = params[:http_host]
        @port    = params[:http_port]
        @path    = params[:http_path]
        @query   = params[:http_query]
        @status  = params[:http_status]
        @reason  = params[:http_reason]
        @device  = params[:http_device]
      end

      def to_s
        a = @msg
        b = ''
        b += "#{@scheme}://" if @scheme
        b += @host if @host
        b +=  ":#{@port}" if @port
        b += @path if @path
        b += "?#{@query}" if @query
        b ? b = "#{b} #{@status}" : b = @status.to_s if @status
        b ? b = "#{b} #{@reason}" : b = "- #{@reason}" if @reason
        b ? b = "#{b}: device #{@device}" : b = "device #{@device}" if @device
        b ? "#{a} #{b}" : a
      end
    end

  end
end
