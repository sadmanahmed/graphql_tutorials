module Mutations
  class DeleteVote < BaseMutation
    argument :link_id, ID, required: true
    argument :user_id, ID, required: true

    type Types::VoteType

    def resolve(link_id:, user_id:)
      vote = Vote.find_by(link: link_id, user: user_id)
      vote.destroy
    end
  end
end