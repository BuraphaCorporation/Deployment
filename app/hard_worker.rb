class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    (0..count).each do |i|
      put "#{name} #{i}"
    end
  end
end
