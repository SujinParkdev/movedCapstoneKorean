class EntranceController < ApplicationController
    before_action :authenticate_user!
    def select_location 
        
    end

    def select_location_post
        input_region = params[:region]
        user_select_new = current_user.user_selects.new 
        user_select_new.location = input_region
        user_select_new.save

        redirect_to '/entrance/select_feel'
    end

    def select_feel
        @select_list = ["고급", "모던", "심플", "세련", "빈티지", "앤틱", "복고", "편안", "아늑", "시끌벅적", "웅장", "아기자기", "캐릭터", "악세서리", "체험", "이국적"]
        @select_list_eng = {"luxury"=>"고급", "modern"=>"모던", "simple"=>"심플", "refined"=>"세련", "vintage"=>"빈티지", "antique"=>"앤틱", "retro"=>"복고", "comfortable"=>"편안", "cosy"=>"아늑", "loud"=>"시끌벅적", "magnificent"=>"웅장", "charming"=>"아기자기", "character"=>"캐릭터", "accessories"=>"악세서리", "experience"=>"체험", "exotic"=>"이국적"}
    end

    def select_feel_post
        pre_select_list = {"고급"=>"1", "모던"=>"1", "심플"=>"1", "세련"=>"1", "빈티지"=>"2", "앤틱"=>"2", "복고"=>"2", "편안"=>"3", "아늑"=>"3", "시끌벅적"=>"4", "웅장"=>"4", "아기자기"=>"5", "캐릭터"=>"5", "악세서리"=>"5", "체험"=>"6", "이국적"=>"7"}
        zip_arr = []
        chk_arr = params[:chk]
        chk_arr.each do |x|
            zip_arr.push(pre_select_list[x])
        end
        user_select_new = current_user.user_selects.last 
        user_select_new.feel = zip_arr.to_s
        user_select_new.save

        redirect_to '/entrance/select_loading'
    end

    def select_loading
        
    end

    def select_traditional #한국적인 것을 구분해서 보여줄 때
        @select_traditional_list=["좋아요","괜찮아요"]
    end
    def select_traditional_post
    end

    def select_location_fdbck
        
    end
end
