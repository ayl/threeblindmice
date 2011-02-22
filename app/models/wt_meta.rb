class WtMeta
  include MongoMapper::Document         
  key :all_count1,         Integer, :default => 0
  key :all_count2,         Integer, :default => 0
  key :all_count3,         Integer, :default => 0
  key :all_count4,         Integer, :default => 0
  key :all_count5,         Integer, :default => 0
  key :all_count6,         Integer, :default => 0
  key :intergenic_count1,  Integer, :default => 0
  key :intergenic_count2,  Integer, :default => 0
  key :intergenic_count3,  Integer, :default => 0
  key :intergenic_count4,  Integer, :default => 0
  key :intergenic_count5,  Integer, :default => 0
  key :intergenic_count6,  Integer, :default => 0
  key :intron_count1,      Integer, :default => 0
  key :intron_count2,      Integer, :default => 0
  key :intron_count3,      Integer, :default => 0
  key :intron_count4,      Integer, :default => 0
  key :intron_count5,      Integer, :default => 0
  key :intron_count6,      Integer, :default => 0
  key :exon_count1,        Integer, :default => 0
  key :exon_count2,        Integer, :default => 0
  key :exon_count3,        Integer, :default => 0
  key :exon_count4,        Integer, :default => 0
  key :exon_count5,        Integer, :default => 0
  key :exon_count6,        Integer, :default => 0
  
  key :all_express1,    Float, :default => 0
  key :all_express2,    Float, :default => 0
  key :all_express3,    Float, :default => 0
  key :all_express4,    Float, :default => 0
  key :all_express5,    Float, :default => 0
  key :all_express6,    Float, :default => 0
  
  key :intergenic_express1,    Float, :default => 0
  key :intergenic_express2,    Float, :default => 0
  key :intergenic_express3,    Float, :default => 0
  key :intergenic_express4,    Float, :default => 0
  key :intergenic_express5,    Float, :default => 0
  key :intergenic_express6,    Float, :default => 0
  
  key :intron_express1,    Float, :default => 0
  key :intron_express2,    Float, :default => 0
  key :intron_express3,    Float, :default => 0
  key :intron_express4,    Float, :default => 0
  key :intron_express5,    Float, :default => 0
  key :intron_express6,    Float, :default => 0
  
  key :exon_express1,    Float, :default => 0
  key :exon_express2,    Float, :default => 0
  key :exon_express3,    Float, :default => 0
  key :exon_express4,    Float, :default => 0
  key :exon_express5,    Float, :default => 0
  key :exon_express6,    Float, :default => 0
  
  def exon_count_expression
    return Array[Hash["x" => 3, "y" => self.exon_count1],
                Hash["x" => 6, "y" => self.exon_count2],
                Hash["x" => 12, "y" => self.exon_count3],
                Hash["x" => 18, "y" => self.exon_count4],
                Hash["x" => 24, "y" => self.exon_count5],
                Hash["x" => 30, "y" => self.exon_count6]]
  end
  
  def intron_count_expression
    return Array[Hash["x" => 3, "y" => self.intron_count1],
                Hash["x" => 6, "y" => self.intron_count2],
                Hash["x" => 12, "y" => self.intron_count3],
                Hash["x" => 18, "y" => self.intron_count4],
                Hash["x" => 24, "y" => self.intron_count5],
                Hash["x" => 30, "y" => self.intron_count6]]
  end
  
  def intergenic_count_expression
    return Array[Hash["x" => 3, "y" => self.intergenic_count1],
                Hash["x" => 6, "y" => self.intergenic_count2],
                Hash["x" => 12, "y" => self.intergenic_count3],
                Hash["x" => 18, "y" => self.intergenic_count4],
                Hash["x" => 24, "y" => self.intergenic_count5],
                Hash["x" => 30, "y" => self.intergenic_count6]]
  end
  
  def exon_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.exon_express1) / self.exon_count1],
                Hash["x" => 6, "y" => Float(self.exon_express2) / self.exon_count2],
                Hash["x" => 12, "y" => Float(self.exon_express3) / self.exon_count3],
                Hash["x" => 18, "y" => Float(self.exon_express4) / self.exon_count4],
                Hash["x" => 24, "y" => Float(self.exon_express5) / self.exon_count5],
                Hash["x" => 30, "y" => Float(self.exon_express6) / self.exon_count6]]
  end
  
  def intron_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.intron_express1) / self.intron_count1],
                Hash["x" => 6, "y" => Float(self.intron_express2) / self.intron_count2],
                Hash["x" => 12, "y" => Float(self.intron_express3) / self.intron_count3],
                Hash["x" => 18, "y" => Float(self.intron_express4) / self.intron_count4],
                Hash["x" => 24, "y" => Float(self.intron_express5) / self.intron_count5],
                Hash["x" => 30, "y" => Float(self.intron_express6) / self.intron_count6]]
  end
  
  def intergenic_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.intergenic_express1) / self.intergenic_count1],
                Hash["x" => 6, "y" => Float(self.intergenic_express2) / self.intergenic_count2],
                Hash["x" => 12, "y" => Float(self.intergenic_express3) / self.intergenic_count3],
                Hash["x" => 18, "y" => Float(self.intergenic_express4) / self.intergenic_count4],
                Hash["x" => 24, "y" => Float(self.intergenic_express5) / self.intergenic_count5],
                Hash["x" => 30, "y" => Float(self.intergenic_express6) / self.intergenic_count6]]
  end
  
  def exon_per_expression
    return Array[Hash["x" => 3, "y" => 100 * Float(self.exon_express1) / self.all_express1],
                Hash["x" => 6, "y" => 100 * Float(self.exon_express2) / self.all_express2],
                Hash["x" => 12, "y" => 100 * Float(self.exon_express3) / self.all_express3],
                Hash["x" => 18, "y" => 100 * Float(self.exon_express4) / self.all_express4],
                Hash["x" => 24, "y" => 100 * Float(self.exon_express5) / self.all_express5],
                Hash["x" => 30, "y" => 100 * Float(self.exon_express6) / self.all_express6]]
  end
  
  def intron_per_expression
    return Array[Hash["x" => 3, "y" => 100 * Float(self.intron_express1) / self.all_express1],
                Hash["x" => 6, "y" => 100 * Float(self.intron_express2) / self.all_express2],
                Hash["x" => 12, "y" => 100 * Float(self.intron_express3) / self.all_express3],
                Hash["x" => 18, "y" => 100 * Float(self.intron_express4) / self.all_express4],
                Hash["x" => 24, "y" => 100 * Float(self.intron_express5) / self.all_express5],
                Hash["x" => 30, "y" => 100 * Float(self.intron_express6) / self.all_express6]]
  end
  
  def intergenic_per_expression
    return Array[Hash["x" => 3, "y" => 100 * Float(self.intergenic_express1) / self.all_express1],
                Hash["x" => 6, "y" => 100 * Float(self.intergenic_express2) / self.all_express2],
                Hash["x" => 12, "y" => 100 * Float(self.intergenic_express3) / self.all_express3],
                Hash["x" => 18, "y" => 100 * Float(self.intergenic_express4) / self.all_express4],
                Hash["x" => 24, "y" => 100 * Float(self.intergenic_express5) / self.all_express5],
                Hash["x" => 30, "y" => 100 * Float(self.intergenic_express6) / self.all_express6]]
  end
  
  def self.loadFile
    meta = WtMeta.new
    count = 0
    f = File.open("/home/ayl/DATA/WT/Analysis/Expression/Final.F2cov.patches.normalized", "r")
    f.each_line do |line|
      a = line.chomp.split("\t")
      type = "intergenic"
      
      #parsing of gene alignment
      gene = "intergenic"
      flagexon = 0
      if a[0] != "intergenic"
        a[0].split(/[ \.:]/).each do |word|
          if word != "" and word != "intergenic" and word.match(/^exon/) == nil and word.match(/^intron/) == nil
            gene = word
          end
          if word.match(/^exon/)
            type = word
            flagexon = 1
          end
          if word.match(/^intron/) and flagexon == 0 
            type = word
          end
        end
      end
      locus = a[1].split(/[:-]/)
      
      # Create new micro rna object.
      @wt = Wt.new(:gene => gene, :fullorigin => a[0], :locus => a[1], 
                            :genetype => type, :chromosome => locus[0], :locusstart => locus[1], 
                            :locusend => locus[2])
      @wt.express3 = Float a[2] unless a[2] == nil
      @wt.express6 = Float a[3] unless a[3] == nil
      @wt.express9 = Float a[4] unless a[4] == nil
      @wt.express12 = Float a[5] unless a[5] == nil
      @wt.express18 = Float a[6] unless a[6] == nil
      @wt.express24 = Float a[7] unless a[7] == nil
      @wt.save
      
      # Add into the meta counters
      meta.all_count1 += 1 unless a[2] == nil
      meta.all_count2 += 1 unless a[3] == nil
      meta.all_count3 += 1 unless a[4] == nil
      meta.all_count4 += 1 unless a[5] == nil
      meta.all_count5 += 1 unless a[6] == nil
      meta.all_count6 += 1 unless a[7] == nil
      meta.all_express1 += Float a[2] unless a[2] == nil
      meta.all_express2 += Float a[3] unless a[3] == nil
      meta.all_express3 += Float a[4] unless a[4] == nil
      meta.all_express4 += Float a[5] unless a[5] == nil
      meta.all_express5 += Float a[6] unless a[6] == nil
      meta.all_express6 += Float a[7] unless a[7] == nil
      if (type.match(/^exon/))
        meta.exon_count1 += 1 unless a[2] == nil
        meta.exon_count2 += 1 unless a[3] == nil
        meta.exon_count3 += 1 unless a[4] == nil
        meta.exon_count4 += 1 unless a[5] == nil
        meta.exon_count5 += 1 unless a[6] == nil
        meta.exon_count6 += 1 unless a[7] == nil
        meta.exon_express1 += Float a[2] unless a[2] == nil
        meta.exon_express2 += Float a[3] unless a[3] == nil
        meta.exon_express3 += Float a[4] unless a[4] == nil
        meta.exon_express4 += Float a[5] unless a[5] == nil
        meta.exon_express5 += Float a[6] unless a[6] == nil
        meta.exon_express6 += Float a[7] unless a[7] == nil
      elsif (type.match(/^intron/))
        meta.intron_count1 += 1 unless a[2] == nil
        meta.intron_count2 += 1 unless a[3] == nil
        meta.intron_count3 += 1 unless a[4] == nil
        meta.intron_count4 += 1 unless a[5] == nil
        meta.intron_count5 += 1 unless a[6] == nil
        meta.intron_count6 += 1 unless a[7] == nil
        meta.intron_express1 += Float a[2] unless a[2] == nil
        meta.intron_express2 += Float a[3] unless a[3] == nil
        meta.intron_express3 += Float a[4] unless a[4] == nil
        meta.intron_express4 += Float a[5] unless a[5] == nil
        meta.intron_express5 += Float a[6] unless a[6] == nil
        meta.intron_express6 += Float a[7] unless a[7] == nil
      else 
        meta.intergenic_count1 += 1 unless a[2] == nil
        meta.intergenic_count2 += 1 unless a[3] == nil
        meta.intergenic_count3 += 1 unless a[4] == nil
        meta.intergenic_count4 += 1 unless a[5] == nil
        meta.intergenic_count5 += 1 unless a[6] == nil
        meta.intergenic_count6 += 1 unless a[7] == nil
        meta.intergenic_express1 += Float a[2] unless a[2] == nil
        meta.intergenic_express2 += Float a[3] unless a[3] == nil
        meta.intergenic_express3 += Float a[4] unless a[4] == nil
        meta.intergenic_express4 += Float a[5] unless a[5] == nil
        meta.intergenic_express5 += Float a[6] unless a[6] == nil
        meta.intergenic_express6 += Float a[7] unless a[7] == nil
      end


      count += 1
      print "count is: " + count.to_s + "\n" if count % 1000 == 0
    end
    meta.save
  end

end
