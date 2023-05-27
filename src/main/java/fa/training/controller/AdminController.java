package fa.training.controller;

import java.io.File;
import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import fa.training.entities.Phim;
import fa.training.model.HienThiPhim;
import fa.training.model.PhimDoanhThu;
import fa.training.page.PageAble;
import fa.training.service.KhachHangService;
import fa.training.service.PhimService;
import fa.training.service.SuDungDichVuService;
import fa.training.service.VeService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	PhimService phimService;
	
	@Autowired
	VeService veService;
	
	@Autowired
	SuDungDichVuService suDungDichVuService;
	
	@Autowired
	KhachHangService khachHangService;
	
	@GetMapping()
	public String getAdminHomePage() {
		return "/admin/home";
	}
	
	@GetMapping("thongke")
	public String getStatistic() {
		return "/admin/thongke";
	}
	
	@GetMapping("thongke/khachhang")
	public String getStatisticKH(Model model) {
		long soNu = khachHangService.getCountByGender("Nữ");
		long soNam = khachHangService.getCountByGender("Nam");
		long tongSo = soNu + soNam;
		long soThieuNien = khachHangService.getCountByAge(0, 18);
		long soThanhNien = khachHangService.getCountByAge(19, 24);
		long soTruongThanh = khachHangService.getCountByAge(25, 30);
		long soTrungNien = khachHangService.getCountByAge(31, 45);
		long soNguoiLon = khachHangService.getCountByAge(46, 999);
		long[] soLieu = {tongSo,soNu,soNam,soThieuNien,soThanhNien,soTruongThanh,soTrungNien,soNguoiLon};
		model.addAttribute("soLieu",soLieu);
		return "/admin/thongkekhachhang";
	}
	
	@GetMapping("thongke/ve")
	public String getStatisticVE() {
		return "/admin/thongkeve";
	}
	
	@GetMapping("thongke/doanhthu")
	public String getStatisticDTByYear(Model model) {
		int nam = 2023;
		List<Object[]> listVe = veService.getDoanhThuTheoNam(nam);
		List<Object[]> listDV = suDungDichVuService.getDoanhThuTheoNam(nam);
		if (listVe.size() == 0 && listDV.size() == 0) {
			model.addAttribute("noInfo", "Hệ thống không tìm thấy có dữ liệu doanh thu cho năm bạn chọn");
			return "/admin/thongkedoanhthutheonam";
		}
		long tongDoanhThu = 0;
		List<long[]> listTong = new ArrayList<>();
		for (int i = 1; i<=12;i++) {
			long[] x = new long[5];
			x[0] = i;
			for (Object[] objects : listVe) {
				if ( i == Integer.parseInt(objects[0].toString())) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[2].toString()));
				x[1] = Math.round(Double.parseDouble(objects[1].toString()));
				x[2] = Math.round(Double.parseDouble(objects[2].toString()));
				break;
				} else {
					x[1] = 0;
					x[2] = 0;
				}
			}
			for (Object[] objects : listDV) {
				if ( i == Integer.parseInt(objects[0].toString())) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[1].toString()));
				x[3] = Math.round(Double.parseDouble(objects[1].toString()));
				break;
				} else {
					x[3] = 0;
				}
			}
			x[4] = x[2] + x[3];
			listTong.add(x);
		}
		model.addAttribute("listDoanhThuPhim" , listTong);
		model.addAttribute("tongDoanhThu",tongDoanhThu);
		model.addAttribute("year", nam);
		return "/admin/thongkedoanhthutheonam";
	}
	
	@GetMapping("thongke/doanhthu/theophim")
	public String getStatisticDT(Model model) {
		List<PhimDoanhThu> phimDoanhThu = new ArrayList<>();
		List<Object[]> list = phimService.getDoanhThu();
		for (int i = 0; i<list.size();i++) {
			PhimDoanhThu pdt = new PhimDoanhThu();
			pdt.setMaPhim(list.get(i)[0].toString());
			pdt.setTenPhim(list.get(i)[1].toString());
			pdt.setDoanhThu(Math.round(Double.parseDouble(list.get(i)[2].toString())));
			phimDoanhThu.add(pdt);
		}
		model.addAttribute("listDoanhThuPhim" , phimDoanhThu);
		return "/admin/thongkedoanhthutheophim";
	}
	
	@GetMapping("thongke/doanhthu/theothang")
	public String getStatisticDTByMonth(Model model, @RequestParam(name = "thang") String thang, @RequestParam(name = "nam") String nam ) {
		int year = Integer.parseInt(nam);
		int month = Integer.parseInt(thang);
		List<Object[]> listVe = veService.getDoanhThuTheoThang(month,year);
		List<Object[]> listDV = suDungDichVuService.getDoanhThuTheoThang(month,year);
		if (listVe.size() == 0 && listDV.size() == 0) {
			model.addAttribute("noInfo", "Hệ thống không tìm thấy có dữ liệu doanh thu cho năm bạn chọn");
			return "/admin/thongkedoanhthutheothang";
		}
		long tongDoanhThu = 0;
		List<Object[]> listTong = new ArrayList<>();
		for (int i = 1; i<=31;i++) {
			String day = "";
			LocalDate date;
			try {
				String toMonth = "-" + month;
				if (month<10) {
					toMonth = "-0" + month;
				}
				String toDay = "-" + i;
				if (i<10) {
					toDay = "-0" + i;
				}
				day = year + toMonth + toDay;
				date = LocalDate.parse(day);
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			}
			Object[] x = new Object[5];
			x[0] = date;
			for (Object[] objects : listVe) { 
				LocalDate toDate = LocalDate.parse(objects[0].toString());
				if (date.equals(toDate)) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[2].toString()));
				x[1] = Math.round(Double.parseDouble(objects[1].toString()));
				x[2] = Math.round(Double.parseDouble(objects[2].toString()));
				break;
				} else {
					x[1] = 0;
					x[2] = 0;
				}
			}
			for (Object[] objects : listDV) {
				LocalDate toDate = LocalDate.parse(objects[0].toString());
				if ( date.equals(toDate)) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[1].toString()));
				x[3] = Math.round(Double.parseDouble(objects[1].toString()));
				break;
				} else {
					x[3] = 0;
				}
			}
			x[4] = Long.parseLong(x[2].toString()) + Long.parseLong(x[3].toString());
			listTong.add(x);
		}
		model.addAttribute("listDoanhThuPhim" , listTong);
		model.addAttribute("tongDoanhThu",tongDoanhThu);
		model.addAttribute("month", thang);
		model.addAttribute("year", nam);
		return "/admin/thongkedoanhthutheothang";
	}
	
	@GetMapping("thongke/doanhthu/theonam")
	public String getStatisticDTByYear(Model model, @RequestParam(name = "nam") String nam) {
		List<Object[]> listVe = veService.getDoanhThuTheoNam(Integer.parseInt(nam));
		List<Object[]> listDV = suDungDichVuService.getDoanhThuTheoNam(Integer.parseInt(nam));
		if (listVe.size() == 0 && listDV.size() == 0) {
			model.addAttribute("noInfo", "Hệ thống không tìm thấy có dữ liệu doanh thu cho năm bạn chọn");
			return "/admin/thongkedoanhthutheonam";
		}
		long tongDoanhThu = 0;
		List<long[]> listTong = new ArrayList<>();
		for (int i = 1; i<=12;i++) {
			long[] x = new long[5];
			x[0] = i;
			for (Object[] objects : listVe) {
				if ( i == Integer.parseInt(objects[0].toString())) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[2].toString()));
				x[1] = Math.round(Double.parseDouble(objects[1].toString()));
				x[2] = Math.round(Double.parseDouble(objects[2].toString()));
				break;
				} else {
					x[1] = 0;
					x[2] = 0;
				}
			}
			for (Object[] objects : listDV) {
				if ( i == Integer.parseInt(objects[0].toString())) {
				tongDoanhThu += Math.round(Double.parseDouble(objects[1].toString()));
				x[3] = Math.round(Double.parseDouble(objects[1].toString()));
				break;
				} else {
					x[3] = 0;
				}
			}
			x[4] = x[2] + x[3];
			listTong.add(x);
		}
		model.addAttribute("listDoanhThuPhim" , listTong);
		model.addAttribute("tongDoanhThu",tongDoanhThu);
		model.addAttribute("year", nam);
		return "/admin/thongkedoanhthutheonam";
	}
	
	@RequestMapping(value = "/")
	@ModelAttribute
	public String trangChu(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<Phim> listPhim = phimService.findPhimDangChieu(pageAble);
		model.addAttribute("totalPages", phimService.totalPagesPhimDangChieu(pageAble));
		model.addAttribute("currentPage", page);
		model.addAttribute("listPhim", listPhim);
		return "index";
	}
	
	/**
	 * 
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @return
	 */
	@RequestMapping(value = "/menu")
	public String menuPhim() {
		return "/phim/menu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/listPhimDangChieu")
	public String listPhimDangChieu(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<Phim> listPhim = phimService.findPhimDangChieu(pageAble);
		List<HienThiPhim> listThongTinPhim = new ArrayList<HienThiPhim>();
		for (Phim phim : listPhim) {
			HienThiPhim hienThiPhim = new HienThiPhim();
			hienThiPhim.setMaPhim(phim.getMaPhim());
			hienThiPhim.setTenPhim(phim.getTenPhim());
			hienThiPhim.setMoTaPhim(phim.getMoTaPhim());
			hienThiPhim.setDaoDien(phim.getDaoDien());
			hienThiPhim.setThoiLuong(phim.getThoiLuong());
			String ngayKhoiChieu = phim.getNgayKhoiChieu().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			hienThiPhim.setNgayKhoiChieu(ngayKhoiChieu);
			String ngayKetThuc = phim.getNgayKetThuc().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			hienThiPhim.setNgayKetThuc(ngayKetThuc);
			hienThiPhim.setPoster(phim.getPoster());
			listThongTinPhim.add(hienThiPhim);
		}
		model.addAttribute("totalPages", phimService.totalPagesPhimDangChieu(pageAble));
		model.addAttribute("currentPage", page);
		model.addAttribute("listThongTinPhim", listThongTinPhim);
		return "/phim/listPhimDangChieu";
	}

	/**
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/listPhimSapChieu")
	public String listPhimSapChieu(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<Phim> listPhim = phimService.findPhimSapChieu(pageAble);
		List<HienThiPhim> listThongTinPhim = new ArrayList<HienThiPhim>();
		for (Phim phim : listPhim) {
			HienThiPhim hienThiPhim = new HienThiPhim();
			hienThiPhim.setMaPhim(phim.getMaPhim());
			hienThiPhim.setTenPhim(phim.getTenPhim());
			hienThiPhim.setMoTaPhim(phim.getMoTaPhim());
			hienThiPhim.setDaoDien(phim.getDaoDien());
			hienThiPhim.setThoiLuong(phim.getThoiLuong());
			String ngayKhoiChieu = phim.getNgayKhoiChieu().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			hienThiPhim.setNgayKhoiChieu(ngayKhoiChieu);
			String ngayKetThuc = phim.getNgayKetThuc().format(DateTimeFormatter.ofPattern("dd-MM-yyyy"));
			hienThiPhim.setNgayKetThuc(ngayKetThuc);
			listThongTinPhim.add(hienThiPhim);
		}
		model.addAttribute("totalPages", phimService.totalPagesPhimSapChieu(pageAble));
		model.addAttribute("currentPage", page);
		model.addAttribute("listThongTinPhim", listThongTinPhim);
		return "/phim/listPhimSapChieu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/them")
	public String themPhim(Model model) {
		model.addAttribute("themphim", new Phim());
		return "/phim/them";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param phim
	 * @param result
	 * @param model
	 * @param redirectAttributes
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/themphim")
	public String savePhim(@Valid @ModelAttribute(name = "themphim") Phim phim, BindingResult result, Model model,
			RedirectAttributes redirectAttributes, @RequestParam(value = "shutdown") MultipartFile file,
			HttpServletRequest request) {
		Phim phim1 = phimService.findById(phim.getMaPhim());
		if (phim1 != null) {
			model.addAttribute("msg3", "Mã phim đã tồn tại trong hệ thống!");
			return "/phim/them";
		}
		if (phim.getNgayKhoiChieu() == null || phim.getNgayKetThuc() == null) {
			model.addAttribute("msg", "Bạn cần phải nhập thông tin ngày!");
			return "/phim/them";
		}
		if (phim.getNgayKhoiChieu().isEqual(LocalDate.now()) == true
				|| phim.getNgayKhoiChieu().isAfter(LocalDate.now()) == false) {
			model.addAttribute("msg4", "Ngày khởi chiếu phải lớn hơn ngày hiện tại!");
			return "/phim/them";
		}
		if (phim.getThoiLuong() == null) {
			model.addAttribute("msg2", "Bạn cần phải nhập thông tin thời lượng đúng định dạng HH:mm");
			return "/phim/them";
		}
		if (phim.getNgayKhoiChieu().plusDays(7).isBefore(phim.getNgayKetThuc()) == false) {
			model.addAttribute("msg1", "Ngày kết thúc phải lớn hơn ngày khởi chiếu ít nhất 7 ngày!");
			return "/phim/them";
		}
		if (result.hasErrors()) {
			return "/phim/them";
		}
		if (file != null) {
			try {
				InputStream inputStream = file.getInputStream();
				if (inputStream == null)
					System.out.println("File inputstream is null");
				String path = request.getSession().getServletContext().getRealPath("/") + "resources/image/";
				FileUtils.forceMkdir(new File(path));
				File upload = new File(path + file.getOriginalFilename());
				System.out.println(path);
				file.transferTo(upload);
				String imagePath = request.getContextPath() + "/resources/image/" + file.getOriginalFilename();
				phim.setPoster(imagePath);
				IOUtils.closeQuietly(inputStream);
			} catch (Exception ex) {
				System.out.println("Upload hình ảnh lỗi!");
			}
		}
		if (phim.getPoster() == null) {
			model.addAttribute("msg5", "Bạn phải tải hình ảnh poster của bộ phim lên!");
			return "/phim/them";
		}
		phimService.save(phim);
		redirectAttributes.addFlashAttribute("msgSave", "Thêm phim thành công!");
		return "redirect:/admin/listPhimSapChieu";
	}

	/**
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/phimupdatedangchieu/{id}")
	public String updatePhimDangChieu(@PathVariable String id, Model model) {
		Phim phim = phimService.findById(id);
		model.addAttribute("themphim", phim);
		return "/phim/updatePhimDangChieu";
	}

	/**
	 * Dang Ngoc Sinh 1998/08/30
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/phimupdatesapchieu/{id}")
	public String updatePhimSapChieu(@PathVariable String id, Model model) {
		Phim phim = phimService.findById(id);
		model.addAttribute("themphim", phim);
		return "/phim/updatePhimSapChieu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 30/08/1998
	 * 
	 * @param phim
	 * @param result
	 * @param model
	 * @param redirectAttributes
	 * @param ketqua
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updatephimdangchieu")
	public String doUpdatePhimDangChieu(@Valid @ModelAttribute(name = "themphim") Phim phim, BindingResult result,
			Model model, RedirectAttributes redirectAttributes,
			@RequestParam(value = "luachon", required = false) String ketqua,
			@RequestParam(value = "shutdown") MultipartFile file, HttpServletRequest request) {
		Phim phim1 = phimService.findById(phim.getMaPhim());
		if (phim.getNgayKhoiChieu().plusDays(7).isBefore(phim.getNgayKetThuc()) == false) {
			model.addAttribute("msg1", "Ngày kết thúc phải lớn hơn ngày khởi chiếu ít nhất 7 ngày!");
			return "/phim/updatePhimDangChieu";
		}
		if (result.hasErrors()) {
			return "/phim/updatePhimDangChieu";
		}
		if (ketqua.equals("")) {
			model.addAttribute("msg5", "Vui lòng chọn mục này!");
			return "/phim/updatePhimDangChieu";
		} else if (ketqua.equals("co")) {
			if (file != null) {
				try {
					InputStream inputStream = file.getInputStream();
					if (inputStream == null)
						System.out.println("File inputstream is null");
					String path = request.getSession().getServletContext().getRealPath("/") + "resources/image/";
					FileUtils.forceMkdir(new File(path));
					File upload = new File(path + file.getOriginalFilename());
					System.out.println(path);
					file.transferTo(upload);
					String imagePath = request.getContextPath() + "/resources/image/" + file.getOriginalFilename();
					phim.setPoster(imagePath);
					phimService.update(phim);
					IOUtils.closeQuietly(inputStream);
				} catch (Exception ex) {
					System.out.println("Upload hình ảnh lỗi!");
				}
			}
		} else if (ketqua.equals("khong")) {
			phim.setPoster(phim1.getPoster());
			phimService.update(phim);
		}
		redirectAttributes.addFlashAttribute("msgUpdate", "Cập nhật phim thành công!");
		return "redirect:/admin/listPhimDangChieu";
	}

	/**
	 * 
	 * Dang Ngoc Sinh 30/08/1998
	 * 
	 * @param phim
	 * @param result
	 * @param model
	 * @param redirectAttributes
	 * @param ketqua
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/updatephimsapchieu")
	public String doUpdatePhimSapChieu(@Valid @ModelAttribute(name = "themphim") Phim phim, BindingResult result,
			Model model, RedirectAttributes redirectAttributes,
			@RequestParam(value = "luachon", required = false) String ketqua,
			@RequestParam(value = "shutdown") MultipartFile file, HttpServletRequest request) {
		Phim phim1 = phimService.findById(phim.getMaPhim());
		if (phim.getNgayKhoiChieu().isEqual(LocalDate.now()) == true
				|| phim.getNgayKhoiChieu().isAfter(LocalDate.now()) == false) {
			model.addAttribute("msg4", "Ngày khởi chiếu phải lớn hơn ngày hiện tại!");
			return "/phim/updatePhimSapChieu";
		}
		if (phim.getThoiLuong() == null) {
			model.addAttribute("msg2", "Bạn cần phải nhập thông tin thời lượng đúng định dạng HH:mm");
			return "/phim/updatePhimSapChieu";
		}
		if (phim.getNgayKhoiChieu().plusDays(7).isBefore(phim.getNgayKetThuc()) == false) {
			model.addAttribute("msg1", "Ngày kết thúc phải lớn hơn ngày khởi chiếu ít nhất 7 ngày!");
			return "/phim/updatePhimSapChieu";
		}
		if (result.hasErrors()) {
			return "/phim/updatePhimSapChieu";
		}
		if (ketqua.equals("")) {
			model.addAttribute("msg5", "Vui lòng chọn mục này!");
			return "/phim/updatePhimSapChieu";
		} else if (ketqua.equals("co")) {
			if (file != null) {
				try {
					InputStream inputStream = file.getInputStream();
					if (inputStream == null)
						System.out.println("File inputstream is null");
					String path = request.getSession().getServletContext().getRealPath("/") + "resources/image/";
					FileUtils.forceMkdir(new File(path));
					File upload = new File(path + file.getOriginalFilename());
					System.out.println(path);
					file.transferTo(upload);
					String imagePath = request.getContextPath() + "/resources/image/" + file.getOriginalFilename();
					phim.setPoster(imagePath);
					phimService.update(phim);
					IOUtils.closeQuietly(inputStream);
				} catch (Exception ex) {
					System.out.println("Upload hình ảnh lỗi!");
				}
			}
		} else if (ketqua.equals("khong")) {
			phim.setPoster(phim1.getPoster());
			phimService.update(phim);
		}
		redirectAttributes.addFlashAttribute("msgUpdate", "Cập nhật phim thành công!");
		return "redirect:/admin/listPhimSapChieu";
	}
	@RequestMapping("/deletephimsapchieu/{id}")
	public String doDeletePhimSapChieu(@PathVariable String id) {
		phimService.delete(id);
		return "redirect:/admin/listPhimSapChieu";
	}
}
