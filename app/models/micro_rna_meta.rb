class MicroRnaMeta
  include MongoMapper::Document         
  key :all_count,         Integer, :default => 0
  key :intergenic_count,  Integer, :default => 0
  key :intron_count,      Integer, :default => 0
  key :exon_count,        Integer, :default => 0
  
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
  
  def percentages_count
    return Array[Hash["name" => "intergenic", "y" => 100 * Float(self.intergenic_count) / self.all_count],  
                Hash["name" => "exon", "y" => 100 * Float(self.exon_count) / self.all_count],
                Hash["name" => "intron", "y"  => 100 * Float(self.intron_count) / self.all_count]]
  end
  
  def exon_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.exon_express1) / self.exon_count],
                Hash["x" => 6, "y" => Float(self.exon_express2) / self.exon_count],
                Hash["x" => 12, "y" => Float(self.exon_express3) / self.exon_count],
                Hash["x" => 18, "y" => Float(self.exon_express4) / self.exon_count],
                Hash["x" => 24, "y" => Float(self.exon_express5) / self.exon_count],
                Hash["x" => 30, "y" => Float(self.exon_express6) / self.exon_count]]
  end
  
  def intron_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.intron_express1) / self.intron_count],
                Hash["x" => 6, "y" => Float(self.intron_express2) / self.intron_count],
                Hash["x" => 12, "y" => Float(self.intron_express3) / self.intron_count],
                Hash["x" => 18, "y" => Float(self.intron_express4) / self.intron_count],
                Hash["x" => 24, "y" => Float(self.intron_express5) / self.intron_count],
                Hash["x" => 30, "y" => Float(self.intron_express6) / self.intron_count]]
  end
  
  def intergenic_avg_expression
    return Array[Hash["x" => 3, "y" => Float(self.intergenic_express1) / self.intergenic_count],
                Hash["x" => 6, "y" => Float(self.intergenic_express2) / self.intergenic_count],
                Hash["x" => 12, "y" => Float(self.intergenic_express3) / self.intergenic_count],
                Hash["x" => 18, "y" => Float(self.intergenic_express4) / self.intergenic_count],
                Hash["x" => 24, "y" => Float(self.intergenic_express5) / self.intergenic_count],
                Hash["x" => 30, "y" => Float(self.intergenic_express6) / self.intergenic_count]]
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
    meta = MicroRnaMeta.new
    count = 0
    f = File.open("/home/ayl/DATA/microRNA/Analysis/Expression/Final.F2cov.patches.normalized", "r")
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
      @micro = MicroRna.new(:gene => gene, :fullorigin => a[0], :locus => a[1], 
                            :genetype => type, :chromosome => locus[0], :locusstart => locus[1], 
                            :locusend => locus[2])
      @micro.express3 = Float a[2]
      @micro.express6 = Float a[3]
      @micro.express9 = Float a[4]
      @micro.express12 = Float a[5]
      @micro.express18 = Float a[6]
      @micro.express24 = Float a[7]
      @micro.save
      
      # Add into the meta counters
      meta.all_count += 1
      meta.all_express1 += Float a[2]
      meta.all_express2 += Float a[3]
      meta.all_express3 += Float a[4]
      meta.all_express4 += Float a[5]
      meta.all_express5 += Float a[6]
      meta.all_express6 += Float a[7]
      if (type.match(/^exon/))
        meta.exon_count += 1
        meta.exon_express1 += Float a[2]
        meta.exon_express2 += Float a[3]
        meta.exon_express3 += Float a[4]
        meta.exon_express4 += Float a[5]
        meta.exon_express5 += Float a[6]
        meta.exon_express6 += Float a[7]
      elsif (type.match(/^intron/))
        meta.intron_count += 1
        meta.intron_express1 += Float a[2]
        meta.intron_express2 += Float a[3]
        meta.intron_express3 += Float a[4]
        meta.intron_express4 += Float a[5]
        meta.intron_express5 += Float a[6]
        meta.intron_express6 += Float a[7]
      else 
        meta.intergenic_count += 1
        meta.intergenic_express1 += Float a[2]
        meta.intergenic_express2 += Float a[3]
        meta.intergenic_express3 += Float a[4]
        meta.intergenic_express4 += Float a[5]
        meta.intergenic_express5 += Float a[6]
        meta.intergenic_express6 += Float a[7]
      end
      count += 1
      print "count is " + count.to_s + "\n" if count % 1000 == 0
    end
    meta.save
  end

end
