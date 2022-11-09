class RanksUpdater
  def update_all
  # 現在のランキング情報をリセット
    Rank.delete_all

    create_ranks
  end

  private

  def create_ranks
    RankOrderMaker.new.each_ranked_user do |user, rank|
      Rank.create(user_id: user.id, rank: rank, score: user.total_score)
    end
  end
end