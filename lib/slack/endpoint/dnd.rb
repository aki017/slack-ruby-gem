# This file was auto-generated by lib/generators/tasks/generate.rb

module Slack
  module Endpoint
    module Dnd
      #
      # Ends the current user's Do Not Disturb session immediately.
      #
      # @see https://api.slack.com/methods/dnd.endDnd
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.endDnd.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.endDnd.json
      def dnd_endDnd(options={})
        post("dnd.endDnd", options)
      end

      #
      # Ends the current user's snooze mode immediately.
      #
      # @see https://api.slack.com/methods/dnd.endSnooze
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.endSnooze.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.endSnooze.json
      def dnd_endSnooze(options={})
        post("dnd.endSnooze", options)
      end

      #
      # Retrieves a user's current Do Not Disturb status.
      #
      # @option options [Object] :user
      #   User to fetch status for (defaults to current user)
      # @see https://api.slack.com/methods/dnd.info
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.info.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.info.json
      def dnd_info(options={})
        post("dnd.info", options)
      end

      #
      # Turns on Do Not Disturb mode for the current user, or changes its duration.
      #
      # @option options [Object] :num_minutes
      #   Number of minutes, from now, to snooze until.
      # @see https://api.slack.com/methods/dnd.setSnooze
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.setSnooze.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.setSnooze.json
      def dnd_setSnooze(options={})
        throw ArgumentError.new("Required arguments :num_minutes missing") if options[:num_minutes].nil?
        post("dnd.setSnooze", options)
      end

      #
      # Retrieves the Do Not Disturb status for users on a team.
      #
      # @option options [Object] :users
      #   Comma-separated list of users to fetch Do Not Disturb status for
      # @see https://api.slack.com/methods/dnd.teamInfo
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.teamInfo.md
      # @see https://github.com/aki017/slack-api-docs/blob/master/methods/dnd.teamInfo.json
      def dnd_teamInfo(options={})
        post("dnd.teamInfo", options)
      end

    end
  end
end
