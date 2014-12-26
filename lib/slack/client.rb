module Slack
  class Client < API

    def self.prefix(prefix)
      Proc.new do |e|
        "#{prefix}.#{e}"
      end
    end

    API_METHODS     = %w(test).map! &prefix('api')
    AUTH_METHODS    = %w(test).map! &prefix('auth')
    CHANNEL_METHODS = %w(archive create history info invite join kick leave list
                         mark rename setPurpose setTopic unarchive
                        ).map! &prefix('channels')
    CHAT_METHODS    = %w(delete postMessage update).map! &prefix('chat')
    EMOJI_METHODS   = %w(list).map! &prefix('emoji')
    FILES_METHODS   = %w(info list upload).map! &prefix('files')
    GROUPS_METHODS  = %w(archive close create createChild history invite kick
                         leave list mark open rename setPurpose setTopic
                         unarchive
                        ).map! &prefix('groups')
    IM_METHODS      = %w(close history list mark open).map! &prefix('im')
    OAUTH_METHODS   = %w(access).map! &prefix('oauth')
    RTM_METHODS     = %w(start).map! &prefix('rtm')
    SEARCH_METHODS  = %w(all files messages).map! &prefix('search')
    STARS_METHODS   = %w(list).map! &prefix('stars')
    USERS_METHODS   = %w(getPresence info list setActive setPresence
                        ).map! &prefix('users')

    METHODS = [API_METHODS, AUTH_METHODS, CHANNEL_METHODS, CHAT_METHODS,
               EMOJI_METHODS, FILES_METHODS, GROUPS_METHODS, IM_METHODS,
               RTM_METHODS, SEARCH_METHODS, STARS_METHODS, USERS_METHODS].flatten

    def base_method(action, *args)
      post(action, *args)
    end

    METHODS.map do |meth|
      define_method(meth.gsub('.', '_').to_sym) {|*args| base_method(meth, *args)}
    end

  end
end
