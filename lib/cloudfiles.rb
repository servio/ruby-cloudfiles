#!/usr/bin/env ruby
#
# == Cloud Files API
# ==== Connects Ruby Applications to Rackspace's {Cloud Files service}[http://www.rackspacecloud.com/cloud_hosting_products/files]
# Initial work by Major Hayden <major.hayden@rackspace.com>
#
# Subsequent work by H. Wade Minter <minter@lunenburg.org> and Dan Prince <dan.prince@rackspace.com>
#
# See COPYING for license information.
# Copyright (c) 2011, Rackspace US, Inc.
# ----
#
# === Documentation & Examples
# To begin reviewing the available methods and examples, peruse the README file, or begin by looking at documentation for the
# CloudFiles::Connection class.
#
# The CloudFiles class is the base class.  Not much of note happens here.
# To create a new CloudFiles connection, use the CloudFiles::Connection.new(:username => 'user_name', :api_key => 'api_key') method.

require 'rubygems'
require 'net/http'
require 'net/https'
require 'rexml/document'
require 'cgi'
require 'uri'
require 'digest/md5'
require 'date'
require 'time'

module CloudFiles

  AUTH_USA = "https://auth.api.rackspacecloud.com/v1.0"
  AUTH_UK = "https://lon.auth.api.rackspacecloud.com/v1.0"

  unless "".respond_to? :each_char
    require "jcode"
    $KCODE = 'u'
  end

  def self.lines(str)
    (str.respond_to?(:lines) ? str.lines : str).to_a.map { |x| x.chomp }
  end

  def self.escape(str)
    URI.encode(str)
  end
end

$:.unshift(File.dirname(__FILE__))
require 'cloudfiles/version'
require 'cloudfiles/exception'
require 'cloudfiles/authentication'
require 'cloudfiles/connection'
require 'cloudfiles/container'
require 'cloudfiles/storage_object'
require 'client'
