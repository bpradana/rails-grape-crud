# frozen_string_literal: true

class UserDumpJob < ApplicationJob
  def perform
    # Do something
    file_path = 'public/users.xlsx'
    public_id = "users_dump_#{Time.now.strftime('%Y%m%d%H%M%S')}.xlsx"

    data = User.left_outer_joins(:posts).select('users.id, users.name, posts.title, posts.body').all

    p = Axlsx::Package.new
    wb = p.workbook
    wb.add_worksheet(name: 'users') do |sheet|
      sheet.add_row %w[id name title body]
      data.each do |d|
        sheet.add_row [d.id, d.name, d.title, d.body]
      end
    end
    p.use_shared_strings = true
    p.serialize(file_path)

    Cloudinary::Uploader.upload(
      file_path,
      public_id:,
      overwrite: true,
      invalidate: true
    )

    Dump.create({ file_name: public_id })
    puts "User dump job completed: #{public_id}"
  end
end
