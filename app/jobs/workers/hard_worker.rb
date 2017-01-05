module Workers
  class HardWorker
    include Sidekiq::Worker

    def perform(name, count)
      # do something
      (0..count).each do |i|
        p "#{name} #{i}"
      end
    end
  end
end
