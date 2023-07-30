class ReportsController < ApplicationController
    def eligible_members
        @end_date = params[:end_date] ? Date.parse(params[:end_date]) : Date.today
        members = Member.eligible_members(@end_date)
        heads = Head.eligible_heads(@end_date)
        @members = members + heads
    
        # Ordenar por fecha de nacimiento (menor -> mayor)
        @members.sort_by! { |m| m.birthdate }
    
        # Revertir la lista para obtener el orden deseado (mayor -> menor)
        @members.reverse!
        # Contar el total de personas
        @total_people = @members.count
      end

      def clap
        @heads = Head.includes(:user)
        .where(user_id: current_user.id)
        .order(Arel.sql("CAST(substring(home_number from '[0-9]+\\-([0-9]+)') AS INTEGER) ASC"))

        @count = @heads.size
        @user = current_user
      end

      def homeland
        @user = current_user
        @heads = Head.left_outer_joins(heads_social_aids: :social_aid)
             .select('heads.id as head_id, heads.cedula, heads.name, heads.sur_name, heads.phone_number, social_aids.name as social_aid_name')
        @people = Head.includes(:user).where(user_id: current_user.id)
        @total_people = @people.size
      end

      def amor_mayor
        @user = current_user
        @heads = Head.joins(:social_aids).where(social_aids: { name: "Amor mayor" })
        @members = Member.joins(:members_social_aids).joins("INNER JOIN social_aids ON social_aids.id = members_social_aids.social_aid_id").where("social_aids.name = ?", "Amor mayor")
        @count = @heads.size + @members.size

      end

  end