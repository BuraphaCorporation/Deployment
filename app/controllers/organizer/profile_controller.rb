module Organizer
  class ProfileController < Organizer::BaseController
    before_action :authenticate_organizer!, except: :show
    before_action :organizer, only: :show

    def show
      @events = @organizer.events

      @covers = [
        {
          image: '/src/images/content/cover-1.jpg',
          caption: '<h1 class="title">ประสบการณ์ใหม่ๆ มีอยู่รอบตัว</h1><div class="subtitle">Daydash ค้นพบกิจกรรมสนุกๆ อีเว้นท์เจ๋งๆ ที่พร้อมให้คุณออกไปสัมผัสได้ทุกวัน</div>'
        },
      ]
    end

    private
      def organizer
        @organizer = User.where.not(role: :user).find_by_slug(params[:organizer])
        not_found if @organizer.blank?
      end
  end
end
