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
  end