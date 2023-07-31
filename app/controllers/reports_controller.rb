class ReportsController < ApplicationController
  def eligible_members
    @user = current_user
    @end_date = params[:end_date] ? Date.parse(params[:end_date]) : Date.today
  
    # Obtener los miembros y los heads elegibles
    @members = Member.joins(head: :user).where(users: { id: @user.id }).eligible_members(@end_date)
    @heads = Head.joins(:user).where(users: { id: @user.id }).eligible_heads(@end_date)
 

    # Ordenar por fecha de nacimiento (menor -> mayor)
    #@members.sort_by! { |m| [m.head&.head_birthdate, m.member_birthdate] }

    # Revertir la lista para obtener el orden deseado (mayor -> menor)
   # @members.reverse!

    # Contar el total de personas
    @count = @heads.size + @members.size
  end
  
  
  def clap
    @user = current_user
    @heads = Head.includes(:user)
    .where(user_id: current_user.id)
    .order(Arel.sql("CAST(substring(home_number from '[0-9]+\\-([0-9]+)') AS INTEGER) ASC"))
    @count = @heads.size  
  end

  def homeland
    @user = current_user
    
    @heads = Head.joins(:social_aids).where(social_aids: { name: "Hogares de la patria" }, user_id: @user.id)
    @heads_without_hogares = Head.where.not(id: @heads.pluck(:id)).where(user_id: @user.id)
    @count = @heads.size + @heads_without_hogares.size
  end

  def amor_mayor
    @user = current_user
    @heads = Head.joins(:social_aids).where(social_aids: { name: "Amor mayor" })
    @members = Member.joins(:members_social_aids).joins("INNER JOIN social_aids ON social_aids.id = members_social_aids.social_aid_id").where("social_aids.name = ?", "Amor mayor")
    @count = @heads.size + @members.size
  end

  def jose_gregorio_hernandez
    @user = current_user
    # Obtener los "heads" con discapacidad
    heads_with_disability = Head.where(disability: true)

    # Generar un hash con el ID de cada "head" y un booleano que indica si tiene o no el "social_aid"
    heads_with_social_aid = heads_with_disability.each_with_object({}) { |head, hash| hash[head.id] = head.social_aids.any? { |social_aid| social_aid.name == "José Gregorio Hernández" } }

    # Obtener los "members" con discapacidad y con la ayuda social "José Gregorio Hernández"
    members_with_social_aid = Member.joins(:members_social_aids).joins("INNER JOIN social_aids ON social_aids.id = members_social_aids.social_aid_id").where("social_aids.name = ?", "José Gregorio Hernández").where(member_disability: true)

    # Generar un hash con el ID de cada "member" y un booleano que indica si tiene o no el "social_aid"
    members_with_social_aid_hash = members_with_social_aid.each_with_object({}) { |member, hash| hash[member.id] = true }

    # Obtener los "members" con discapacidad y sin la ayuda social "José Gregorio Hernández"
    members_without_social_aid = Member.where(member_disability: true).where.not(id: members_with_social_aid.map(&:id))

    # Guardar los resultados en la instancia @results
    @heads = heads_with_social_aid.map { |head_id, has_social_aid| { head: Head.find(head_id), has_social_aid: has_social_aid } }
    @members = members_with_social_aid_hash.merge(members_without_social_aid.each_with_object({}) { |member, hash| hash[member.id] = false }).map { |member_id, has_social_aid| { member: Member.find(member_id), has_social_aid: has_social_aid } }
    @count = @heads.size + @members.size
  end
end