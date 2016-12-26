class EasyWorker
  include Sidekiq::Worker

  def perform(name, count)
    (0..count).each do |i|
      p "#{name} #{i}"
    end
  end
end
