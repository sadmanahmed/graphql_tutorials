module Mutations
  class CreateVote < BaseMutation
    argument :link_id, ID, required: false
    argument :user_id, ID, required: false

    type Types::VoteType

    def resolve(link_id: nil, user_id: nil)
      Vote.create!(
        link: Link.find(link_id),
        # if user_id.nil?
        user: User.find(user_id)
        # else
        #   user: context[:current_user]
        # end
      )
    end
  end
end