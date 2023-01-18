package com.ispan6.service.postsystem;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cache.CacheProperties.Couchbase;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.ispan6.bean.postsystem.LikepostBean;
import com.ispan6.bean.postsystem.PostBean;
import com.ispan6.dao.postsystem.LikepostDAO;
import com.ispan6.dao.postsystem.PostDAO;

@Service
@Transactional
public class PostService {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private LikepostDAO likepostDAO;

	public List<PostBean> getAllPostBean() {
		return postDAO.findAll();
	}

	public void insertOrUpdate(PostBean postBean) {
		postDAO.save(postBean);
	}

	public List<PostBean> findAllPosts() {
		return postDAO.findAllByOrderByPosttimeDesc();
	}

	public void deletePost(Integer postid) {
		postDAO.deleteById(postid);
	}

	public List<PostBean> getLatest() {
		return postDAO.findAllByOrderByPosttimeDesc();
	}

	// 拿最新的
	public List<PostBean> findLatest() {
		return postDAO.findFirstByOrderByPosttimeDesc();

	}

	public PostBean findBypostid(Integer postid) {
		Optional<PostBean> optional = postDAO.findpostBypostid(postid);

		if (optional.isPresent()) {
			return optional.get();
		}

		return null;
	}

	public Page<PostBean> findByPostPage(Integer pageNumber) {
		int length = 10; // 设置默认页面大小为 10
		int postCount = postDAO.findAll().size(); // 获取貼文数量
		if (postCount > 0) { // 如果貼文数量大于 0
			length = postCount; // 将页面大小设置为貼文数量
		}
		Pageable pgb = PageRequest.of(pageNumber - 1, length, Direction.DESC, "posttime");
		return postDAO.findAll(pgb);
	}

	public byte[] getPicture(Integer postId) {
		// 只要呼叫Optional.get就會拿到對應的Bean
		Optional<PostBean> postOptional = postDAO.findById(postId);
		PostBean post = postOptional.get();
		return post.getPicture();
	}
	
//這是假設like的資料表裡的likeid不存在
//	public Integer plusLike(Integer postId) {
//		
//		likepostDAO.findById(postId);
//		
//		LikepostBean lB = new LikepostBean();
//		//存postid的方法
//		PostBean pB = new PostBean();
//		pB.setPostid(postId);
//		
//		lB.setPost(pB);
//		likepostDAO.save(lB);
//		return 1;
//	}

	

	public Integer plusLike(Integer postId) {
        // 取出該 postId 的 likepost 資料
        List<LikepostBean> like = likepostDAO.findBypostid(postId);
        //判斷 postId 的 likepost 資料是否存在 (like.isEmpty())
        if (like.isEmpty()) {
            // 若該 postId 的 likepost 資料不存在，則新建一筆likeBean資料
            LikepostBean lB = new LikepostBean();
            // 將該筆 likepost 資料的 post 設定為 postId 的 post 物件
            lB.setPost(postDAO.findById(postId).orElse(null));
            lB.setCount(1);
            likepostDAO.save(lB);
            return 1;
        } else {
            // 若 postId 的 likepost 資料已存在，則取出該筆資料
            LikepostBean lB = like.get(0);
            // 將該筆 likepost 資料的 count 值加 1
            lB.setCount(lB.getCount() + 1);
            likepostDAO.save(lB);
            return lB.getCount();
        }
    }
	

	
//	
//	public Page<PostBean> findByPostPage(Integer pageNumber){
//		int length=postDAO.findAll().size();
//		Pageable pgb = PageRequest.of(pageNumber-1,length, Direction.DESC,"posttime");
//		
//		return postDAO.findAll(pgb);
//		
//	}

}
