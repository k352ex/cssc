class IndexController < ApplicationController

	def index
		@post = Post.all.last(5) 		# 공지 게시판 최근 게시물 5개
		@board = Board.all.last(5)		# 자유 게시판 최근 게시물 5개

		@PostCount = Post.all.size 		# 공지 게시판 게시글 갯수
		@BoardCount = Board.all.size    # 자유 게시판 게시글 갯수

		# 오늘 날짜와 같은 최신 게시물이 있다면 @today_post = 1
		Post.all.reverse.each do |p|
			if p.created_at.strftime("%Y %m %d") == Time.now.strftime("%Y %m %d")
				@today_post = 1
				break
			else
				@today_post = 0
				break
			end
		end
	end

end
