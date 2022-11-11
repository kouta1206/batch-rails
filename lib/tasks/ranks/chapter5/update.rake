require 'objspace'
namespace :ranks do
  namespace :Chapter5 do
    desc 'chapter3 ゲーム内のユーザーランキング情報を更新する'
    task update: :environment do
      Development::UsedMemoryReport.instance.write('start batch')
          Chapter5::RanksUpdater.new.update_all
          Development::UsedMemoryReport.instance.write('end batch')
          Development::UsedMemoryReport.instance.puts_all
    end
  end
end