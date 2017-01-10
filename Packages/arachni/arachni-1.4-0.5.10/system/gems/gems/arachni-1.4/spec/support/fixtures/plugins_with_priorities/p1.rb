=begin
    Copyright 2010-2016 Tasos Laskos <tasos.laskos@arachni-scanner.com>

    This file is part of the Arachni Framework project and is subject to
    redistribution and commercial restrictions. Please see the Arachni Framework
    web site for more information on licensing and terms of use.
=end

class Arachni::Plugins::P1 < Arachni::Plugin::Base
    def self.info
        {
            name:     'P1',
            author:   'Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>',
            priority: 1
        }
    end
end
