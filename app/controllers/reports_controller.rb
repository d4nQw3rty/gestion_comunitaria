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
  end