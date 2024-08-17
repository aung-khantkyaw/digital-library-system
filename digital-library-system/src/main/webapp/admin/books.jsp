<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/head.jsp"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<div class="card">
        <div class="card-body">
          <!-- Bordered Tabs -->
          <ul
            class="nav nav-tabs nav-tabs-bordered my-3"
            id="borderedTab"
            role="tablist"
          >
            <li class="nav-item" role="presentation">
              <button
                class="nav-link active"
                id="home-tab"
                data-bs-toggle="tab"
                data-bs-target="#bordered-home"
                type="button"
                role="tab"
                aria-controls="home"
                aria-selected="true"
              >
                Physical Books
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button
                class="nav-link"
                id="profile-tab"
                data-bs-toggle="tab"
                data-bs-target="#bordered-profile"
                type="button"
                role="tab"
                aria-controls="profile"
                aria-selected="false"
              >
                E-Books
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button
                class="nav-link"
                id="contact-tab"
                data-bs-toggle="tab"
                data-bs-target="#bordered-contact"
                type="button"
                role="tab"
                aria-controls="contact"
                aria-selected="false"
              >
                Add New Book
              </button>
            </li>
          </ul>
          <div class="tab-content pt-2" id="borderedTabContent">
            <div
              class="tab-pane fade show active"
              id="bordered-home"
              role="tabpanel"
              aria-labelledby="home-tab"
            >
              <section class="section">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card">
                      <div class="card-body">
                        <!-- Table with stripped rows -->
                        <table class="table datatable">
                          <thead>
                            <tr>
                              <th>Cover</th>
                              <th>Title</th>
                              <th>Author</th>
                              <th>Price per day</th>
                              <th>Quantity</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>100</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>200</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <!-- End Table with stripped rows -->
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <div
              class="tab-pane fade"
              id="bordered-profile"
              role="tabpanel"
              aria-labelledby="profile-tab"
            >
              <section class="section">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="card">
                      <div class="card-body">
                        <!-- Table with stripped rows -->
                        <table class="table datatable">
                          <thead>
                            <tr>
                              <th>Cover</th>
                              <th>Title</th>
                              <th>Author</th>
                              <th>Price per day</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-1.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>အစဉ်သဖြင့်</td>
                              <td>ငြိမ်းကျော်</td>
                              <td>MMK - 150</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                <img
                                  src="../assets/img/news-2.jpg"
                                  alt="Book Cover"
                                  class="rounded"
                                  width="50"
                                />
                              </td>
                              <td>သူငယ်ချင်းလို့ဆက်၍ခေါ်မည်ခိုင်</td>
                              <td>တက္ကသိုလ် ဘုန်းနိုင်</td>
                              <td>MMK - 250</td>
                              <td>
                                <a href="#" class="btn btn-primary"
                                  ><i class="ri-edit-line"></i
                                ></a>
                                <a href="#" class="btn btn-success"
                                  ><i class="ri-eye-line"></i
                                ></a>
                                <a href="#" class="btn btn-danger"
                                  ><i class="ri-delete-back-2-line"></i
                                ></a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                        <!-- End Table with stripped rows -->
                      </div>
                    </div>
                  </div>
                </div>
              </section>
            </div>
            <div
              class="tab-pane fade"
              id="bordered-contact"
              role="tabpanel"
              aria-labelledby="contact-tab"
            >
              <div class="row mb-5 mx-auto">
                <div class="col-sm-6">
                  <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">@</span>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Username"
                      aria-label="Username"
                      aria-describedby="basic-addon1"
                    />
                  </div>

                  <div class="input-group mb-3">
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Recipient's username"
                      aria-label="Recipient's username"
                      aria-describedby="basic-addon2"
                    />
                    <span class="input-group-text" id="basic-addon2"
                      >@example.com</span
                    >
                  </div>

                  <label for="basic-url" class="form-label"
                    >Your vanity URL</label
                  >
                  <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3"
                      >https://example.com/users/</span
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="basic-url"
                      aria-describedby="basic-addon3"
                    />
                  </div>

                  <div class="input-group mb-3">
                    <span class="input-group-text">$</span>
                    <input
                      type="text"
                      class="form-control"
                      aria-label="Amount (to the nearest dollar)"
                    />
                    <span class="input-group-text">.00</span>
                  </div>

                  <div class="input-group mb-3">
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Username"
                      aria-label="Username"
                    />
                    <span class="input-group-text">@</span>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Server"
                      aria-label="Server"
                    />
                  </div>

                  <div class="input-group">
                    <span class="input-group-text">With textarea</span>
                    <textarea
                      class="form-control"
                      aria-label="With textarea"
                    ></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- End Bordered Tabs -->
        </div>
      </div>

<%@ include file="../layout/footer.jsp"%>