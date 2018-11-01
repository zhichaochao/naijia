<?php

/**
 * Company Profile信息页控制器
 * @author  dyl 783973660@qq.com 2016.10.6
 */
class ControllerInformationAllreviews extends Controller {
	private $error = array();


	public function index()
	{
		$this->load->language('information/contact');
		$this->document->setTitle('SHOWS');

		$data['shopping'] =$this->url->link('product/hotcategory', '', true);
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);




		// $this->load->language('product/product');

        $this->load->model('catalog/review');

        // $data['text_no_reviews'] = $this->language->get('text_no_reviews');


        // $product_info = $this->model_catalog_product->getProduct($product_id);
        // print_r($product_info);exit;
        // if(!empty($product_info)){

            $this->load->model('catalog/review');


            // $review_total = $this->model_catalog_review->getTotalReviewsByProductId($product_info['product_id']);
            $results1 = $this->model_catalog_review->getAllreviews();
             $results2 = $this->model_catalog_review->getAllreviewsed();
            $results = array_merge($results1, $results2);
            // print_r($results);exit;
            $this->load->model('tool/image');
            foreach ($results as $result) {
                $review_img = $this->model_catalog_review->getReviewImgs($result['review_id']);
// print_r($review_img);exit;
             foreach($review_img as $key=>$row){
                    //$review_img[$key]['img'] = HTTP_SERVER.$row['path'];
                    $review_img[$key]['img'] = $this->model_tool_image->resize( $row['images'], 112, 112);
                    $review_img[$key]['min_img'] = $this->model_tool_image->resize($row['images'], 400, 400);
                    $review_img[$key]['big_img'] = $this->model_tool_image->resize($row['images'], 600, 600);
                }
                $thumbsnot= $this->model_catalog_review->thumbsornot($result['review_id']);
               $thumbstotal =$this->model_catalog_review->getTotalsThumbs($result['review_id']);

               if (isset($row)) {
                  $thumbs=$this->model_tool_image->resize($row['images'],400,400);
                }else{
                    $thumbs= '';
                }
               // print_r($thumbs);exit;

                $data['allreviews'][] = array(
                    'review_id'     => $result['review_id'],
                    'href'     =>$this->url->link('product/product','product_id='.$result['product_id']),
                    'author'        => substr($result['author'],0,-2).'***',
                    'text'          => nl2br($result['text']),
                    'thumbs'          =>$thumbs,
                    'length'          => nl2br($result['length']),
                    'style'          => nl2br($result['style']),
                    // 'thumbs'          =>$result['thumbs'],
                    'rating'        => (int)$result['rating'],
                    //'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
                    'date_added'    => date('m/d/Y', strtotime($result['date_added'])),
                    'rating_starts' => $this->ratingStarts($result['rating']),
                    'images'        => $review_img,
                    'thumbstotal'    =>$thumbstotal,
                    'thumbsnot'    =>$thumbsnot
                );
            }
            // print_r( $data['allreviews']);exit;
        // }
        // if(isset($_SERVER['HTTP_REFERER'])){
        //     $data['home'] =$_SERVER['HTTP_REFERER'];
        // }

        // dianzan
        $data['addthumbs'] = $this->url->link('product/product/addthumbs');
        $data['deletethumbs'] = $this->url->link('product/product/deletethumbs');

        // $data['revi'] = $product_info['reviews'];
        // $data['rating'] = $product_info['rating'];
      









		

			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');


		
				$this->response->setOutput($this->load->view('information/allreviews', $data));
			
		

	}
	 protected function ratingStarts($rating){
        $retingStarts = '';
        $starts = ' Star';

        switch($rating){
            case 1: $retingStarts = 'One'.$starts; break;
            case 2: $retingStarts = 'Two'.$starts; break;
            case 3: $retingStarts = 'Three'.$starts; break;
            case 4: $retingStarts = 'Four'.$starts; break;
            case 5: $retingStarts = 'Five'.$starts; break;
        }

        return $retingStarts;
    }

   
}